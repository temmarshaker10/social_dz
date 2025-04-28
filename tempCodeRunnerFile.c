#include<stdio.h>
int co(char t[20]){
    int i = 0;
    int j = 0;
    while(t[i] != '\0'){
    if(t[i] == ' ')
    j++;
i++;
    }
return j + 1;

}
void re(char t[20]){
    int i = 0;
    while(t[i] != '\0'){
    if(t[i] == ' ')
    t[i] = '-';
  i++;
}
printf("the reblace is : %s ", t);
}
int main(){
    char t[20] = "hello world";
    int c = co(t);
    printf(" the number of words is : %d\n ", c);
    re(t);
  
    return 0;
}
