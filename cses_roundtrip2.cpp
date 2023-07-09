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
const int mxN=1e5;
int n,m,p[mxN];
vector<int> adj[mxN];
bool vis[mxN], act[mxN];


void dfs(int u){
    vis[u]=1;
    act[u]=1;
    for(int v: adj[u]){
        if(act[v]){//this is to detect cycle, if cycle detected then we generate the array of answer
            vector<int> ans={u};
            while(u^v){
                u=p[u];
                ans.push_back(u);
            }          
            ans.push_back(ans[0]);
            reverse(ans.begin(),ans.end());
            cout<<ans.size()<<"\n";
            for(int a: ans){
                cout<<a+1<<" ";
            }
            exit(0);
        }
        else{
            if(!vis[v]){
                p[v]=u;
                dfs(v);
            }
        }
    }
    act[u]=0;
}

int main(){
   cin>>n>>m;
   for(int i=0;i<m;++i){
        ll a,b;
        cin>>a>>b,--a,--b;
        adj[a].push_back(b);
   }
   for(int i=0; i<n; ++i){
    if(!vis[i]){
        dfs(i);
    }
   }
   cout<<"IMPOSSIBLE";  
}