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
//simple problem
const int mxN=1e6;
int n;
ll dp[mxN+1];
int main(){
    cin>>n;
    for(int i=1;i<=n;++i){
        dp[i]=1e9;
        int i2=i;
        while(i2){
            dp[i]=min(dp[i],dp[i-i2%10]+1);//dp[i] is the minimum steps needed to go from i to 0
            i2/=10;//if the number is d1d2d3d4...dk;;;i2/=10 gives us a way to get all the digits of the number to traverse and check
            //dp[n]=1+dp[n-di]//we what dp[n-di] to be minimum.
        }
    } 
    cout<<dp[n];
}