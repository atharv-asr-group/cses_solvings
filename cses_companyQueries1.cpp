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

//sum of subtree sizes

const int mxN=2e5;
int n, d[mxN], anc[mxN][19],q,p;//d is for depth and anc is for ancestor//anc[node][i'th level ancestor(see line 52)]
vector<int> adj[mxN];

void dfs(int u=0, int p=-1){
    anc[u][0]=p;
    //constructing the binary lifting table.
    for(int i=1;i<19;++i){
        // cout<<~anc[u][i-1]<<" ";
        anc[u][i]=~anc[u][i-1]?anc[anc[u][i-1]][i-1]:-1;
    }
    for(int v: adj[u]){
        if(v==p){
            continue;
        }
        d[v]=d[u]+1;
        dfs(v,u);
    }
}
int main(){
    cin>>n>>q;
    for(int i=1;i<n;++i){
        cin>>p,--p;
        adj[p].push_back(i);
    }
    dfs();
    while(q--){
        int x,k;
        cin>>x>>k , --x;
        if(d[x]<k){
            cout<<"-1\n";
        }else{
            for(int i=18; ~i; --i){
                if(k>>i&1){
                    x=anc[x][i];
                }
                //printing according to binary indexing.
            }
            cout<<x+1<<"\n";
        }
    }
}