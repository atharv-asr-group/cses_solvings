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
//segment tree question
//update and then sum, only few line changed from dynamic range sum queries question.

const int mxN=2e5;
int n,q;
 ll x[mxN];

struct node{
    ll mn, s, lz;//s is the sum, writing lazy oblogation
    bool lz2=0;
} st[1<<19];


//push and apply function
void app(int i,ll x,bool x2, int l2,int r2){
    if(x2){
        st[i].s=0;
        st[i].lz=0;
        st[i].lz2=1;
    }
    st[i].mn+=x;
    st[i].s+=x*(r2-l2+1);
    st[i].lz+=x; 
}
void psh(int i,int l2,int m2,int r2){
    app(2*i, st[i].lz,st[i].lz2, l2, m2);
    app(2*i+1, st[i].lz,st[i].lz2, m2+1, r2);
    st[i].lz=0;
    st[i].lz2=0;
}

void upd(int l1,ll x,int i=1,int l2=0,int r2=n-1){
    if(l2==r2){
        st[i].mn=x;
        st[i].s=x;
        return;
    }
    int m2=(l2+r2)/2;
    psh(i,l2,m2,r2);
    if(l1<=m2)
        upd(l1,x,2*i,l2,m2);
    // if(m2<r1)
    else
        upd(l1,x,2*i+1,m2+1,r2);
    st[i].mn=min(st[2*i].mn, st[2*i+1].mn);
    st[i].s=st[2*i].s+st[2*i+1].s;
}
void upd2(int l1,int r1,ll x, bool x2, int i=1,int l2=0,int r2=n-1){
    if(l1<=l2&&r2<=r1){
        app(i,x,x2,l2,r2);
        return;
    }
    int m2=(l2+r2)/2;
    psh(i,l2,m2,r2);
    if(l1<=m2)
        upd2(l1,r1,x,x2,2*i,l2,m2);
    if(m2<r1)
        upd2(l1,r1,x,x2,2*i+1,m2+1,r2);
    st[i].mn=min(st[2*i].mn, st[2*i+1].mn);
    st[i].s=st[2*i].s+st[2*i+1].s;
    
}
ll qry(int l1,int r1,int i=1,int l2=0,int r2=n-1){
    if(l1<=l2&&r2<=r1){
        return st[i].s;
    }
    int m2=(l2+r2)/2;
    psh(i,l2,m2,r2);
    return (l1<=m2?qry(l1,r1,2*i,l2,m2):0)+(m2<r1?qry(l1,r1,2*i+1,m2+1,r2):0);
}

vector<ar<int,2>> ta[mxN];
int ans[mxN];
int main(){
    cin>>n>>q;
    for(int i=0; i<n; ++i){
        cin>>x[i], upd(i,x[i]);
    }
    while(q--){
        int qt;
        cin>>qt;
        if(qt==1){
            int a,b,u;
            cin>>a>>b>>u,--a,--b;
            upd2(a,b,u,0);
        }
        else if(qt==2){
            int a,b,u;
            cin>>a>>b>>u,--a,--b;
            upd2(a,b,u,1);
        }
        else if(qt==3){
            int a,b;
            cin>>a>>b,--a,--b;
            cout<<qry(a,b)<<"\n";
        }
    }
    


}