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
//standard problem, like the prev prob, now not taking the 
//minimum but adding all the possiblities together.

const int mxN=100, mxX=1e6 ,M=1e9+7;
int n,c[mxN],x;
ll dp[mxX+1];
int main(){
    cin>>n>>x;
    for(int i=0;i<n;++i)
        cin>>c[i];
    dp[0]=1;
    for(int i=1; i<=x; ++i){
        for(int j=0;j<n;++j){
            if(c[j]<=i){
                dp[i]=(dp[i]+dp[i-c[j]])%M;
            }
        }
    }
    cout<<dp[x];
}