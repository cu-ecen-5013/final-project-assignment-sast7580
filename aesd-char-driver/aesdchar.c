/**
 * @file aesdchar.c
 * @brief Functions and data related to the AESD char driver implementation
 *
 * Based on the implementation of the "scull" device driver, found in
 * Linux Device Drivers example code.
 *
 * @author Dan Walkes
 * @date 2019-10-22
 * @copyright Copyright (c) 2019
 *
 */
 
/**
 * External resources utilized to complete this file are as under:
 *
 * Source-1: http://derekmolloy.ie/writing-a-linux-kernel-module-part-2-a-character-device/
 * Source-2: https://www.geeksforgeeks.org/linux-kernel-module-programming-hello-world-program/
 * Source-3: https://github.com/cu-ecen-5013/ldd3-samples.git
 */
 
//////////////////////////////////////////////////////
// Header Files
//////////////////////////////+////////////////////////

#include <linux/module.h>
#include <linux/init.h>
#include <linux/printk.h>
#include <linux/types.h>
#include <linux/cdev.h>
#include <linux/fs.h> // file_operations
#include <linux/device.h>         // Header to support the kernel Driver Model
#include <linux/kernel.h>         // Contains types, macros, functions for the kernel
#include <linux/uaccess.h>          // Required for the copy to user function
#include <linux/slab.h>
#include "aesdchar.h"

//////////////////////////////////////////////////////
// Global variables & definitions
//////////////////////////////+////////////////////////

int aesd_major =   0; // use dynamic major
int aesd_minor =   0;

MODULE_AUTHOR("Rushi Macwan"); /** TODO: fill in your name **/
MODULE_LICENSE("Dual BSD/GPL");

struct aesd_dev aesd_device;

//////////////////////////////////////////////////////
// Additional global variables
//////////////////////////////+////////////////////////

static int device_open_cnt = 0; 	// Device open instances
//static char data_buf[1024] = {0}; 	// Limited size device_data buffer during this edition
static char *data_buf;
//static short size_of_data_buf;		// Size of the data_buf buffer

//////////////////////////////////////////////////////
// Module function prototypes and structures
//////////////////////////////+////////////////////////

int 		aesd_open(struct inode *inode, struct file *filp);
int 		aesd_release(struct inode *inode, struct file *filp);
ssize_t 	aesd_read(struct file *filp, char __user *buf, size_t count, loff_t *f_pos);
ssize_t 	aesd_write(struct file *filp, const char __user *buf, size_t count, loff_t *f_pos);
static int 	aesd_setup_cdev(struct aesd_dev *dev);

struct file_operations aesd_fops = {
	.owner =    THIS_MODULE,
	.read =     aesd_read,
	.write =    aesd_write,
	.open =     aesd_open,
	.release =  aesd_release,
};

//////////////////////////////////////////////////////
// Module function definitions
//////////////////////////////+////////////////////////

int aesd_open(struct inode *inode, struct file *filp)
{
	PDEBUG("open");
	
	//////////////////////////////////////////////////////
	// aesd_open handling
	//////////////////////////////////////////////////////
	
	device_open_cnt++;
	//printk(KERN_INFO "/dev/aesdchar: Device has been opened %d time(s)\n", device_open_cnt);
	struct aesd_dev *dev; /* device information */
	dev = container_of(inode->i_cdev, struct aesd_dev, cdev);
	filp->private_data = dev; /* for other methods */
	
	return 0;
}

int aesd_release(struct inode *inode, struct file *filp)
{
	PDEBUG("release");
	
	//////////////////////////////////////////////////////
	// aesd_release handling
	//////////////////////////////////////////////////////
	
	//printk(KERN_INFO "/dev/aesdchar: Device has been closed\n");
	
	return 0;
}

ssize_t aesd_read(struct file *filp, char __user *buf, size_t count,
                loff_t *f_pos)
{
	ssize_t retval = 0;
	PDEBUG("read %zu bytes with offset %lld",count,*f_pos);
	
	//////////////////////////////////////////////////////
	// aesd_read handling
	//////////////////////////////////////////////////////

	struct aesd_dev *dev = filp->private_data; 

	if (copy_to_user(buf, data_buf, count)) 
	{
		retval = -EFAULT;
		goto out;
	}
	
	*f_pos += count;
	retval = count;
	
  out:
	return retval;	
}

ssize_t aesd_write(struct file *filp, const char __user *buf, size_t count,
                loff_t *f_pos)
{
	ssize_t retval = -ENOMEM;
	PDEBUG("write %zu bytes with offset %lld",count,*f_pos);
	
	//////////////////////////////////////////////////////
	// aesd_write handling
	//////////////////////////////////////////////////////
	
	struct aesd_dev *dev = filp->private_data;
	
	if (copy_from_user(data_buf, buf, count)) 
	{
		retval = -EFAULT;
		goto out;
	}
	
	*f_pos += count;
	retval = count;
	
  out:
	return retval;
}

static int aesd_setup_cdev(struct aesd_dev *dev)
{
	int err, devno = MKDEV(aesd_major, aesd_minor);

	cdev_init(&dev->cdev, &aesd_fops);
	dev->cdev.owner = THIS_MODULE;
	dev->cdev.ops = &aesd_fops;
	err = cdev_add (&dev->cdev, devno, 1);
	if (err) {
		printk(KERN_ERR "Error %d adding aesd cdev", err);
	}
	return err;
}

//////////////////////////////////////////////////////
// Module init and exit
//////////////////////////////+////////////////////////

int aesd_init_module(void)
{
	printk(KERN_INFO "/dev/aesdchar: Initializing the aesdchar module\n");
	
	dev_t dev;
	dev = 0;
	int result;
	result = alloc_chrdev_region(&dev, aesd_minor, 1,
			"aesdchar");
	aesd_major = MAJOR(dev);
	if (result < 0) {
		printk(KERN_WARNING "Can't get major %d\n", aesd_major);
		return result;
	}
	memset(&aesd_device,0,sizeof(struct aesd_dev));

	//////////////////////////////////////////////////////
	// Driver initialization
	//////////////////////////////////////////////////////
	
	data_buf = kmalloc(1024, GFP_KERNEL);
	
	
	result = aesd_setup_cdev(&aesd_device);

	if( result ) {
		unregister_chrdev_region(dev, 1);
	}
	return result;

}

void aesd_cleanup_module(void)
{
	dev_t devno = MKDEV(aesd_major, aesd_minor);

	cdev_del(&aesd_device.cdev);

	//////////////////////////////////////////////////////
	// Driver cleanup
	//////////////////////////////////////////////////////

	kfree(data_buf);
	

	unregister_chrdev_region(devno, 1);
}

	module_init(aesd_init_module);
	module_exit(aesd_cleanup_module);
