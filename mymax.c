#include <linux/init.h>  
#include <linux/module.h>  
      
#include "mymax.h"  
MODULE_LICENSE("Dual BSD/GPL");  
      
void mymax(void)  
{  
    printk("test1, enter max\n");  
}  

EXPORT_SYMBOL(mymax);  


