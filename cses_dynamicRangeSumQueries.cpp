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
//update and then sum, only few line changed from static range minimum queries question.

const int mxN=2e5;
int n,q;
 ll x[mxN];

struct node{
    ll mn, s;//s is the sum
} st[1<<19];



void upd(int l1,ll x,int i=1,int l2=0,int r2=n-1){
    if(l2==r2){
        st[i].mn=x;
        st[i].s=x;
        return;
    }
    int m2=(l2+r2)/2;
    if(l1<=m2)
        upd(l1,x,2*i,l2,m2);
    else
        upd(l1,x,2*i+1,m2+1,r2);
    st[i].mn=min(st[2*i].mn, st[2*i+1].mn);
    st[i].s=st[2*i].s+st[2*i+1].s;
}

ll qry(int l1,int r1,int i=1,int l2=0,int r2=n-1){
    if(l1<=l2&&r2<=r1){
        return st[i].s;
    }
    int m2=(l2+r2)/2;
    return (l1<=m2?qry(l1,r1,2*i,l2,m2):0)+(m2<r1?qry(l1,r1,2*i+1,m2+1,r2):0);
}
int main(){
    cin>>n>>q;
    for(int i=0; i<n; ++i){
        cin>>x[i], upd(i, x[i]);
    }
    while(q--){
        int a,b,qt;
        cin>>qt>>a>>b,--a,--b;
        if(qt==2)
            cout<<qry(a,b)<<"\n";
        else
            upd(a,b+1);//update a-1 to b.    
    }


}