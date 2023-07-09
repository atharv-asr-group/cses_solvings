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
//standard dp problem
const int mxN=1e3, M=1e9+7;
int n;
ll dp[mxN][mxN];
string s[mxN];
int main(){
    cin>>n;
    for(int i=0;i<n;++i){
        cin>>s[i];
    }
    dp[0][0]=1;
    for(int i=0;i<n;++i){//counting number of paths from upper left to lower right
        for(int j=0;j<n;++j){
            if(i)//either choose from the top or from the left 
                dp[i][j]+=dp[i-1][j];//dp[i][j]= number of ways to get from the left grid
            if(j)
                dp[i][j]+=dp[i][j-1];//dp[i][j]=number of ways to get from the top grid
            dp[i][j]%=M;
            if(s[i][j]=='*')//if current square is * then set the dp to zero 
                dp[i][j]=0;
        }
    }
    cout<<dp[n-1][n-1];
}