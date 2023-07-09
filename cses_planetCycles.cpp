#include<iostream>
#include<vector>
#include<queue>
#include<functional>
#include<cstring>
#include<array>
#include<set>
#include<algorithm>
#include<map>
#define ll long long
using namespace std;
#define ar array

//similar to last question

const int mxN=2e5;
int n, q,d[mxN], rt[mxN], rp[mxN], t[mxN], ds[mxN], de[mxN], cr[mxN], dt,cs[mxN];
vector<int> adj[mxN], cyc;
bool vis[mxN];



void dfs1(int u){
    ds[u]=dt++;
    for(int v: adj[u]){
        if(rt[v]^v){
            d[v]=d[u]+1;
            rt[v]=rt[u];
            cr[v]=cr[u];
            dfs1(v);
        }
    }
    de[u]=dt;
}
int main(){
   cin>>n;
   for(int i=0;i<n;++i){
    // int t;
    cin>>t[i], --t[i];
    adj[t[i]].push_back(i);
   }
   memset(rt,-1,4*n);
   for(int i=0; i<n; ++i){
    if(~rt[i]){
        continue;
    }
    int u=i;
    while(!vis[u]){
        vis[u]=1;
        u=t[u];
    }
    while(!cyc.size()||u^cyc[0]){
        rp[u]=cyc.size();
        cyc.push_back(u);
        rt[u]=u;
        cr[u]=i;
        u=t[u];
    }
    for(int ci: cyc){
        dt=0, dfs1(ci);
        cs[ci]=cyc.size();
    }
    // dfs1(i);
    cyc.clear();
   }
   for(int i=0; i<n; ++i){
    cout<<d[i]+cs[rt[i]]<<" ";
   }
    
   
}