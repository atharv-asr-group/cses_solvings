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



const int mxN=2e5;
int n,q,t[30][mxN];

int main(){
   cin>>n>>q;
   for(int i=0; i<n; ++i){
        cin>>t[0][i], --t[0][i];
   }
   for(int j=1;j<30;++j){
    for(int i=0; i<n; ++i){
        t[j][i]=t[j-1][t[j-1][i]];
    }
   }
   while(q--){
    int x,k;
    cin>>x>>k, --x;
    for(int i=0;i<30;++i){
        if(k>>i&1){
            x=t[i][x];
        }
    }
    cout<<x+1<<"\n";
   }
}
