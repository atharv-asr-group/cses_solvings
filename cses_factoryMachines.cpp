#include<iostream>
#include<vector>
#include<array>
#include<set>
#include<algorithm>
#include<map>
#define ll long long
using namespace std;
#define ar array

const int mxN=2e5;
ll n,t,a[mxN];


//binary search is done
int main(){
    cin>>n>>t;
    for(int i=0;i<n;++i){
        cin>>a[i];
    }
    ll lb=1, rb=1e18;
    while(lb<rb){
        ll mb=(rb+lb)/2, s=0;
        for(int i=0;i<n;++i){
            s+=min(mb/a[i],(ll) 1e9);
        }
        if(s>=t){
            rb=mb;
        }else{
            lb=mb+1;
        }
        
    }
    cout<<lb;
    
}