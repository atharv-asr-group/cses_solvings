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
//update and then sum, only few line changed from dynamic range sum queries question.

const int mxN=2e5;
int n,q;
 ll x[mxN];

struct node{
    ll mn, s, lz;//s is the sum, writing lazy oblogation
} st[1<<19];


//push and apply function
void app(int i,ll x,int l2,int r2){
    st[i].mn+=x;
    st[i].s+=x*(r2-l2+1);
    st[i].lz+=x;
}
void psh(int i,int l2,int m2,int r2){
    app(2*i, st[i].lz, l2, m2);
    app(2*i+1, st[i].lz, m2+1, r2);
    st[i].lz=0;
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
void upd2(int l1,int r1,ll x, int i=1,int l2=0,int r2=n-1){
    if(l1<=l2&&r2<=r1){
        app(i,x,l2,r2);
        return;
    }
    int m2=(l2+r2)/2;
    psh(i,l2,m2,r2);
    if(l1<=m2)
        upd2(l1,r1,x,2*i,l2,m2);
    if(m2<r1)
        upd2(l1,r1,x,2*i+1,m2+1,r2);
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
        cin>>x[i];
    }
    for(int i=0;i<q;++i){
        int a,b;
        cin>>a>>b,--a,--b;
        ta[b].push_back({a,i});
    }
    map<int, int> mp;//map will store their last occurence
    for(int i=0;i<n;++i){
        upd(i,1);
        if(mp.find(x[i])!=mp.end()){
            upd(mp[x[i]],0);
        }
        mp[x[i]]=i;//update the map for the last occurence.
        for(ar<int,2> a:ta[i]){
            ans[a[1]]=qry(a[0],i);
        }
    }
    for(int i=0;i<q;++i){
        cout<<ans[i]<<"\n";
    }


}