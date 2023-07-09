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
//talked about segment tree and it is on cp algorithms.

//similar code of range update queries except binary search

const int mxN=2e5;
int n,q;
 ll x[mxN];

struct node{
    ll s, mxl, mxr, mx;//mx  is the answer
} st[1<<19];



ll qry(int l1,int r1,int i=1,int l2=0,int r2=n-1){
    if(l1<=l2&&r2<=r1){
        return st[i].mx;
    }
    int m2=(l2+r2)/2; 
    return max(l1<=m2?qry(l1,r1,2*i,l2,m2):0,m2<r1?qry(l1,r1,2*i+1,m2+1,r2):0);
}

int qry2(int x, int i=1, int l2=0, int r2=n-1){
    if(l2==r2)
        return l2;
    int m2=(l2+r2)/2;
    if(st[2*i].mx>=x)
        return qry2(x,2*i,l2,m2);
    return qry2(x,2*i+1,m2+1,r2);
}

int main(){
    cin>>n>>q;
    for(int i=0; i<n; ++i){
        cin>>x[i], upd(i, x[i]);
    }
    while(q--){
       int k;
       cin>>k, --k;
       cin>>x[k];
       upd(k,x[k]);
       cout<<max(st[1].mx, 0ll)<<"\n";
    }
}



