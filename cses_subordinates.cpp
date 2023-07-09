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

//find the subtree size for each subtree

const int mxN=2e5;
int n, s[mxN];
vector<int> adj[mxN];

void dfs(int u=0, int p=-1){
    s[u]=1;
    for(int v: adj[u]){
        dfs(v,u);
        s[u]+=s[v];
    }
}



int main(){
    cin>>n;
    for(int i=1;i<n;++i){
        int p;
        cin>>p,--p;
        adj[p].push_back(i);
    }
    dfs();
    for(int i=0;i<n;++i){
        cout<<s[i]-1<<" ";
    }
}