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
//standard knapsak dp problem
const int mxN=1e3,mxX=1e5, M=1e9+7;
int n,x,h[mxN],s[mxN],dp[mxX+1];//dp stores the maximum number of pages for a given price
//h is the price
int main(){
    cin>>n>>x;
    for(int i=0;i<n;++i){
        cin>>h[i];
    }
    for(int i=0; i<n; ++i)
        cin>>s[i];
    for(int i=0; i<n;++i)
        for(int j=x;j>=h[i];--j)
            dp[j]=max(dp[j], dp[j-h[i]]+s[i]);//would like to buy the j-1 books with maximum pages and add the pages of the current book
    cout<<dp[x];
}