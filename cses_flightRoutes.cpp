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

//dijkstra maybe

const int mxN=1e5;
int n,m,k;
vector<ar<ll,2>> adj[mxN];
vector<ll> d[mxN];


int main(){
   cin>>n>>m>>k;
   for(int i=0;i<m;++i){
        ll a,b,c;
        cin>>a>>b>>c,--a,--b;
        adj[a].push_back({c,b});
   }
   priority_queue<ar<ll,2>,vector<ar<ll,2>>,greater<ar<ll,2>>> pq;
   pq.push({0,0});
   while(pq.size()){
    ar<ll,2> u=pq.top();
    pq.pop();
    if(d[u[1]].size()>=k){
        continue;
    }
    d[u[1]].push_back(u[0]);
    for(ar<ll,2> v: adj[u[1]]){
        pq.push({u[0]+v[0],v[1]});
    } 
   }
   for(int i=0; i<k; ++i){
        cout<<d[n-1][i]<<" ";
   }
}