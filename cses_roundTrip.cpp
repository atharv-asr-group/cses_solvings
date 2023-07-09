#include<iostream>
#include<vector>
#include<queue>
#include<cstring>
#include<array>
#include<set>
#include<algorithm>
#include<map>
#define ll long long
using namespace std;
#define ar array
//will do dfs, and detecting a cycle.
const int mxN=1e5;
int n,m,p[mxN];
vector<int> adj[mxN], ans;
bool vis[mxN];


void dfs(int u, int pu=-1){
    p[u]=pu;
    vis[u]=1;
    for(int v: adj[u]){
        if(v==pu){
            continue;
        }if(vis[v]){
            int u2=u;
            while(u^v){
                ans.push_back(u);
                u=p[u];
            }
            ans.push_back(v);
            ans.push_back(u2);
            cout<<ans.size()<<"\n";
            for(int a: ans){
                cout<<a+1<<" ";
            }
            exit(0);
        }else{
            dfs(v,u);
        }
    }
}
int main(){
    cin>>n>>m;
    for(int i=0, a,b;i<m;++i){
        cin>>a>>b,--a,--b;
        adj[a].push_back(b);
        adj[b].push_back(a);
    }
    memset(p,-1,4*n);
    for(int i=0; i<n; ++i){
    if(!vis[i]){
        dfs(i);
    }
   }
   cout<<"IMPOSSIBLE";
}