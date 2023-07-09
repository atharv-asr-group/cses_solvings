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
//dp, the minimum number of moves to cut 
const int mxN=500;
int dp[mxN+1][mxN+1];

int main(){
    int a,b;
    cin>>a>>b;
    for(int i=1;i<=a;++i){
        for(int j=1;j<=b; ++j){
            if(i^j)//setting the dp value
                dp[i][j]=1e9;
            for(int k=1; k<i; ++k){//trying to a horizontal cut and divide into 2 halfs
                dp[i][j]=min(dp[i][j], dp[k][j]+dp[i-k][j]+1);//explanation in notes
            }
            for(int k=1; k<j; ++k)//trying to do a vertical cut and divide into 2 halfs
                dp[i][j]=min(dp[i][j], dp[i][k]+dp[i][j-k]+1);
        }
    }
    cout<<dp[a][b];
}