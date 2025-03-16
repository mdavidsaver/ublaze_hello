#include <sleep.h>
#include <xil_printf.h>

int main()
{
    unsigned cnt = 0;
    while(1) {
        xil_printf("Hello world! %u\n", cnt++);
        sleep(1);
    }
}
