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
//

const int mxN=5e3;
int n, x[mxN];
ar<ll, 2> dp[mxN][mxN];

int main(){
    cin>>n;
    for(int i=0; i<n; ++i)
        cin>>x[i];
    for(int i=n-1; ~i; --i){//standard range dp
        for(int j=i+1; j<n; ++j){
            ar<ll, 2> tr;
            if(i==j)
                tr={x[i],0};//your score and your opponent score
            else{//otherwise you have 2 choices
                if(dp[i+1][j][1]+x[i]>dp[i][j-1][1]+x[j])//this removes the first element
                    tr={dp[i+1][j][1]+x[i], dp[i+1][j][0]};
                else   //this removes the last element
                    tr={dp[i][j-1][1]+x[j], dp[i][j-1][0]};
            }
            dp[i][j]=tr;
        }
    }
    cout<<dp[0][n-1][0];//access the first element(the last [0]) to give the maximum score.

}