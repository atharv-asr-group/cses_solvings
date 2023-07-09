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
//knapsac dp

const int mxN=5e2, M=1e9+7;
int n;
ll dp[mxN*(mxN+1)/2+1];//the second bracket denotes the maximum sum possible

int main(){
    cin>>n;
    int s=n*(n+1)/2; 
    if(s&1){//first we need to check if the sum is div by 2
        cout<<0;
        return 0;
    }
    s/=2;
    dp[0]=1;//initialising the base case
    for(int i=1; i<=n; ++i)//
        for(int j=i*(i+1)/2; j>=i; --j)
            dp[j]=(dp[j]+dp[j-i])%M;//transition happening?
    cout<<dp[s]*((M+1)/2)%M;//did overcount so have to muliply with the modulo inverse of 2 to fix it.
}