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

//dijkstra's algorithm 

const int mxN=1e5,M=1e9+7;
int n,m,p[mxN],dp[mxN];
vector<int> adj[mxN],ans;
bool vis[mxN], act[mxN];
ll d[mxN];
vector<ar<ll,2>> adj2[mxN];


void dfs(int u){
    dp[u]=u==n-1?1:0;
    vis[u]=1;
    act[u]=1;
    for(int v: adj[u]){
        if(act[v]){
            cout<<"IMPOSSIBLE";
            exit(0);
        }
        else{
            if(!vis[v]){
                p[v]=u;
                dfs(v);
                
            }
        }
        dp[u]=(dp[u]+dp[v])%M;
    }
    act[u]=0;
}

//this is for minimum
void dfs2(int u){
    dp[u]=u==n-1?1:1e9;
    vis[u]=1;
    act[u]=1;
    for(int v: adj[u]){
        if(act[v]){
            cout<<"IMPOSSIBLE";
            exit(0);
        }
        else{
            if(!vis[v]){
                p[v]=u;
                dfs2(v);
                
            }
        }
        if(dp[v]+1<dp[u]){
                    p[u]=v;
                    // setting the dp value.
                    dp[u]=dp[v]+1;
                }
    }
    act[u]=0;
}
//this is for maximum
void dfs3(int u){
    dp[u]=u==n-1?1:-1e9;
    vis[u]=1;
    act[u]=1;
    for(int v: adj[u]){
        if(act[v]){
            cout<<"IMPOSSIBLE";
            exit(0);
        }
        else{
            if(!vis[v]){
                p[v]=u;
                dfs3(v);   
            }
        }
        if(dp[v]+1>dp[u]){
                    p[u]=v;
                    // setting the dp value.
                    dp[u]=dp[v]+1;
                }
    }
    act[u]=0;
}



int main(){
   cin>>n>>m;
   for(int i=0;i<m;++i){
        ll a,b,c;
        cin>>a>>b>>c,--a,--b;
        adj2[a].push_back({c,b});
   }
   memset(d,0x3f,sizeof(d));
   d[0]=0;
   priority_queue<ar<ll,2>,vector<ar<ll,2>>,greater<ar<ll,2>>> pq; 

   pq.push({0,0});
   while(pq.size()){
    ar<ll,2> u=pq.top();
    pq.pop();
    if(u[0]>d[u[1]]){
        continue;
    }
    for(ar<ll,2> v: adj2[u[1]]){
        if(d[v[1]]>u[0]+v[0]){
            d[v[1]]=u[0]+v[0];
            pq.push({d[v[1]],v[1]}); 
        }
    }
   }
   for(int i=0; i<n ; ++i){
        for(ar<ll,2> j: adj2[i]){
            // checking the distances
            if(d[i]+j[0]==d[j[1]]){
                adj[i].push_back(j[1]);
            }
        }
   }
   for(int i=0; i<n; ++i){
        if(!vis[i]){
            dfs(i);
        }
   }
   cout<<d[n-1]<<" "<<dp[0];
   memset(vis,0,n);
   for(int i=0; i<n; ++i){
    if(!vis[i]){
        dfs2(i);
    }
   }
   cout<<" "<<dp[0]-1;
   memset(vis,0,n);
   for(int i=0; i<n; ++i){
    if(!vis[i]){
        dfs3(i);
    }
   }
   cout<<" "<<dp[0]-1;
}
