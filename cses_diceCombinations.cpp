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
const int mxN=1e6, M=1e9+7;
//sum of the last 6 elements
int n;
ll dp[mxN+1];
int main(){
    cin>>n;
    dp[0]=1;
    for(int i=1;i<=n;i++){
        for(int j=1;j<=min(6,i);++j){
            dp[i]=(dp[i]+dp[i-j])%M;//if I get i, the I look for number of ways to get i-j, to make the sum n when i=n.
        }//eg if I get a 1, then I look for the number of ways to get sum n-1.
    }
    cout<<dp[n];
}
    

