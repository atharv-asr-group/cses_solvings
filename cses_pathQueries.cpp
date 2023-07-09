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

//subtree update, very similar to subtree queries question.

const int mxN=2e5;
int n, d[mxN], anc[mxN][19],q,c[mxN], dt, ds[mxN], de[mxN];//d is for depth and anc is for ancestor
vector<int> adj[mxN];
ll ans[mxN],ft[mxN+1], a[mxN];


void upd(int i, int x){
    for(++i; i<=n; i+=i&-i)
        ft[i]+=x;
}

ll qry(int i){
    ll r=0;
    for(;i;i-=i&-i)
        r+=ft[i];
    return r;
}
void dfs(int u=0, int p=-1){
    anc[u][0]=p;
    // s[u]=1;
    //constructing the binary lifting table.
    for(int i=1;i<19;++i){
        anc[u][i]=~anc[u][i-1]?anc[anc[u][i-1]][i-1]:-1;
    }
    // writing a binary index tree
    ds[u]=dt++;
    for(int v: adj[u]){
        if(v==p){
            continue;
        }
        d[v]=d[u]+1;
        dfs(v,u);
    }
    de[u]=dt;
}
//lca-lowest common ancester
int lca(int u, int v){
    if(d[u]<d[v]){
        swap(u,v);
    }
    for(int i=18; ~i;--i){
        if(d[u]-(1<<i)>=d[v]){
            u=anc[u][i];
        }
    }
    if(u==v)
        return u;
    for(int i=18; ~i; --i)
        if(anc[u][i]^anc[v][i]){
            u=anc[u][i], v=anc[v][i];
        }
    return anc[u][0];
}

int main(){
    cin>>n>>q;
    for(int i=0; i<n; ++i){
        cin>>a[i];
    }
    for(int i=1;i<n;++i){
        int p,q;
        cin>>p>>q,--p,--q;
        adj[p].push_back(q);
        adj[q].push_back(p);

    }
    dfs();
    for(int i=0; i<n; ++i){
        upd(ds[i],a[i]), upd(de[i], -a[i]);
    }
    while(q--){
     int qt;
     cin>> qt;
     if(qt==1){
        int s,x;
        cin>>s>>x,--s;
        upd(ds[s], x-a[s]);
        upd(de[s], a[s]-x);
        a[s]=x;
    }else{
        int s;
        cin>>s, --s;
        // cout<<qry(de[s])-qry(ds[s])<<"\n";
        cout<<qry(ds[s]+1)<<"\n";
    }
    
}}