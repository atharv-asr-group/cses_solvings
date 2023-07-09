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
//similar to labyrinth BFS
const int mxN=1e5;
int n,m,p[mxN];
vector<int> adj[mxN], ans;


int main(){
    cin>>n>>m;
    for(int i=0, a,b;i<m;++i){
        cin>>a>>b,--a,--b;
        adj[a].push_back(b);
        adj[b].push_back(a);
    }
    memset(p,-1,4*n);
    queue<int> qu;
    qu.push(0);
    p[0]=-2;
    while(qu.size()){
        int u=qu.front();
        qu.pop();
        for(int v: adj[u]){
            if(p[v]<0){
                p[v]=u;
                qu.push(v);
            }
        }
    }
    if(p[n-1]<0){
        cout<<"IMPOSSIBLE";
    }
    else{
        int u=n-1;
        while(u){
            ans.push_back(u);
            u=p[u];
        }

        ans.push_back(0);
        reverse(ans.begin(),ans.end());
        cout<<ans.size()<<"\n";
        
        for(int a: ans){
            cout<<a+1<<" ";
        }
    
    }
}
