#include<iostream>
#include<vector>
#define ll long long
using namespace std;
int main(){
   ll n;
   cin>>n;
   if(n*(n+1)/2%2){
    cout<<"NO";
    return 0;
   }
   vector<int> v1,v2;
   int j=0;
   if(n%4){
    j=3;
   }
   else{
    j=4;
   }
   for(int i=0;i<(n-1)/4;++i){
    v1.push_back(4*i+1+j);
    v1.push_back(4*i+4+j);
    v2.push_back(4*i+2+j);
    v2.push_back(4*i+3+j);
   }
   if(n%4){
    v1.push_back(1);
    v1.push_back(2);
    v2.push_back(3);
   }else{
    v1.push_back(1);
    v1.push_back(4);
    v2.push_back(3);
    v2.push_back(2);
   }
   cout<<"YES\n";
   cout<<v1.size()<<"\n";
   for(int i: v1){
    cout<<i<<" ";
   }
   cout<<"\n";
   cout<<v2.size()<<"\n";
   for(int i: v2){
    cout<<i<<" ";
   }

   
}