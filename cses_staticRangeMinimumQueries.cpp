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
// written segment tree, standard template
const int mxN=2e5;
int n,q;
ll x[mxN];

struct node{
    ll mn;
} st[1<<19];
void upd(int l1,int x,int i=1,int l2=0,int r2=n-1){
    if(l2==r2){
        st[i].mn=x;
        return;
    }
    int m2=(l2+r2)/2;
    if(l1<=m2)
        upd(l1,x,2*i,l2,m2);
    else
        upd(l1,x,2*i+1,m2+1,r2);
    st[i].mn=min(st[2*i].mn, st[2*i+1].mn);
}

int qry(int l1,int r1,int i=1,int l2=0,int r2=n-1){
    if(l1<=l2&&r2<=r1){
        return st[i].mn;
    }
    int m2=(l2+r2)/2;
    return min(l1<=m2?qry(l1,r1,2*i,l2,m2):(int)1e9,m2<r1?qry(l1,r1,2*i+1,m2+1,r2):(int)1e9);
}
int main(){
    cin>>n>>q;
     for(int i=0; i<n; ++i){
        cin>>x[i], upd(i, x[i]);
     }
     while(q--){
        int a,b;
         cin>>a>>b,--a,--b;
         cout<<qry(a,b)<<"\n";
     }
}