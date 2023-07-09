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

const int mxN=5e3;
string s,t;
int dp[mxN+1][mxN+1];

int main(){
    cin >> s>> t;
    for(int i=1; i<=s.size(); ++i){//initialisation
        dp[i][0]=i;
    }
    for(int j=1; j<=t.size(); ++j)//initialisation
        dp[0][j]=j;
    for(int i=1; i<=s.size(); ++i){
        for(int j=1; j<=t.size();++j){
            dp[i][j]=1e9;
            if(s[i-1]==t[j-1]){//if the character start is same then we are allowed to ignore them
                dp[i][j]=dp[i-1][j-1];
            }
            dp[i][j]=min({dp[i][j]-1,dp[i-1][j-1],dp[i-1][j], dp[i][j-1]})+1;//otherwise we have to get the min of all these +1. Written in the notes
        }
    }
    cout<<dp[s.size()][t.size()];
}