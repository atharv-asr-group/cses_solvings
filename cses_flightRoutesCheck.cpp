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

//very similar to planet and kingdoms

const int mxN=1e5, mxM=2e5;
int n,m,p[mxN], s[mxN], who[mxN];
vector<int> adj[mxN], adj2[mxN],st,co;
bool vis[mxN];


void dfs1(int u){
    vis[u]=1;
    for(int v: adj[u]){
        if(!vis[v]){
            dfs1(v);
        }
    }
    st.push_back(u);
}

void dfs2(int u, int rt){
    vis[u]=0;
    who[u]=rt;
    for(int v: adj2[u]){
        if(vis[v]){
            dfs2(v,rt);
        }
    }
    co.push_back(u);
}

int main(){
   cin>>n>>m;
   for(int i=0,a,b;i<m;++i){
    cin>>a>>b,--a,--b;
    adj[a].push_back(b);
    adj2[b].push_back(a);
   }
   for(int i=0; i<n; ++i){
    if(!vis[i]){
        dfs1(i);
    }
   }
   vector<int> ans;
   for(int i=n-1; ~i; --i){
        if(vis[st[i]]){
            dfs2(st[i],st[i]);
            if(co.size()==n){
                cout<<"YES";
                return 0;
            }
            else{
                ans.push_back(st[i]);
            }
            co.clear();
        }
   }
   
   cout<<"NO\n"<<ans[1]+1<<" "<<ans[0]+1;
  
    
   
}