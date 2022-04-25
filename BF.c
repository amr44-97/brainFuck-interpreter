#include "/home/amr/AM/LibStr/c/LibStr.h"
#include "/home/amr/AM/LibStr/c/file_handle.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <limits.h>

#define STAK_LEN 30000





int interpret_bf(){
    file  fp = read_file_to_string("./test.bf");
    
    int Stack[STAK_LEN]={0};
    int unmathcedbrac=0;
    
    char *c = fp.buf.str; 
    int s=STAK_LEN/2;

    for(int i=0; i < (int)fp.buf.length ;i++){
            
        switch (c[i]) {
        case '+':  
            Stack[s]++;
            break;
        case '-':
            Stack[s]--;
            break;
        case '>':
            s++;
            break;
        case '<':
            s--;
            break;
        case '.':
            putc(Stack[s], stdout);
            break;
        case ',':   
            Stack[s] = getchar();
            break;
        case '[':       
            if(Stack[s] == 0){
                unmathcedbrac++;
                while (c[i] != ']' || unmathcedbrac != 0) {
                    i++;
                    if(c[i] == '['){
                        unmathcedbrac++;
                    }
                    else if (c[i] == ']') {
                        unmathcedbrac--;
                    }
                }
            }

            break;
        case ']':   
             if(Stack[s] != 0){
                unmathcedbrac++;
                while (c[i] != '[' || unmathcedbrac != 0) {
                    i--;
                    if(c[i] == '['){
                        unmathcedbrac--;
                    }
                    else if (c[i] == ']') {
                        unmathcedbrac++;
                    }
                }
            }

            break;

        }



    }

    return 0;
}




int main(){

  
interpret_bf();



}
