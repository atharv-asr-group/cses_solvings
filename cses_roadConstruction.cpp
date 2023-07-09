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
int n,m,p[mxN], s[mxN];
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
    s[y]+=s[x];
    return 1;
}

int main(){
   cin>>n>>m;
   for(int i=0;i<m;++i){
    cin>>e[i][1]>>e[i][2];
    --e[i][1], --e[i][2];
   }
   iota(p,p+n,0);
   fill(s,s+n,1);
   int a1=n;//no of edges added
   int a2=1;//total cost

   for(int i=0;i<m;++i){
    if(join(e[i][1],e[i][2])){
        --a1, a2=max(a2,s[find(e[i][1])]);
    }
    cout<<a1<<" "<<a2<<"\n";
   } 

  
    
   
}