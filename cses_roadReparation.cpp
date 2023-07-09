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

//road construction and road repairation are similar
//disjoint sets problems
//road construction- minimum spanning tree

const int mxN=1e5, mxM=2e5;
int n,m,p[mxN];
ar<int, 3> e[mxM];
ll ans;
//i think this finds parent
int find(int x){
    return x^p[x]?p[x]=find(p[x]):x;
}

bool join(int x,int y){
    if((x=find(x))==(y=find(y)))
        return 0;
    p[x]=y;
    return 1;
}

int main(){
   cin>>n>>m;
   for(int i=0;i<m;++i){
    // int t;
    cin>>e[i][1]>>e[i][2]>>e[i][0];
    --e[i][1], --e[i][2];
   }
   sort(e,e+m);
   iota(p,p+n,0);
   int a1=0;//no of edges added
   ll a2=0;//total cost

   for(int i=0;i<m;++i){
    if(join(e[i][1],e[i][2])){
        ++a1, a2+=e[i][0];
    }
   } 

   if(a1<n-1){
    cout<<"IMPOSSIBLE";
   }
   else{
    cout<<a2;
   }
    
   
}