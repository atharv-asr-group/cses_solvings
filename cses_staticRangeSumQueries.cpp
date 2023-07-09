#include<iostream>
#include<vector>
#include<queue>
#include<functional>
#include<cstring>
#include<array>
#include<set>
#include<numeric>//for iota
#include<algorithm>
#include<map>
#define ll long long
using namespace std;
#define ar array

const int mxN=2e5;
int n,q;
 ll x[mxN+1];

// this is just like prefix problems

int main(){
    cin>>n>>q;
     for(int i=0; i<n; ++i){
        cin>>x[i+1];
        x[i+1]+=x[i];
     }
     while(q--){
        int a,b;
         cin>>a>>b,--a;
         cout<<x[b]-x[a]<<"\n";
     }
}