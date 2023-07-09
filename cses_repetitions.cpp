#include<iostream>
#include<vector>
// #include <bits/stdc++.h>
#define ll long long
using namespace std;

int main(){
   string s;
   cin>>s;
   int ans=0,c=0;
   char l='A';
   for(char d:s){
    if(d==l){
        ++c;
        ans=max(c,ans);
    }
    else{
        l=d;
        c=1;
    }
   }
   cout<<ans;
}