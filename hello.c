#include <linux/init.h>
#include <linux/module.h>  
#include "./mymax.h"  
      
MODULE_LICENSE("Dual BSD/GPL");  

static int hello_init(void)  
{  
     printk("test1, Hello world\n");  
     mymax();  
     return 0;  
}  

static void hello_exit(void)  
{  
    printk("test1, Good bye\n");  
}  
      
module_init(hello_init);  
module_exit(hello_exit);  

