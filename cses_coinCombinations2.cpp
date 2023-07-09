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

//standard problem, just changed the for loop sequence

const int mxN=100, mxX=1e6 ,M=1e9+7;
int n,c[mxN],x;
ll dp[mxX+1];
int main(){
    cin>>n>>x;
    for(int i=0;i<n;++i)
        cin>>c[i];
    dp[0]=1;
    for(int j=0;j<n;++j){
        for(int i=1; i<=x; ++i){
            if(c[j]<=i){
                dp[i]=(dp[i]+dp[i-c[j]])%M;//number of ways to make sum i-cj, when cj coin is added, answer comes when i=x.
            }
        }
    }
    cout<<dp[x]; 
}