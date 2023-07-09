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

//knapsac problem, its like the second version which forces you
//to write bit sets.

const int mxN=100, mxX=1e5;
int dp[mxX+1],x[mxN],n;

int main(){
    cin>>n;
    for(int i=0; i<n; ++i)
        cin>>x[i];
    dp[0]=1;
    for(int j=0; j<n; ++j) //putting the dp, go through all the possible values
        for(int i=mxX;i>=1; --i)
            if(i>=x[j])//then we can do a transition
                dp[i]|=dp[i-x[j]];

    vector<int> ans;
    for(int i=1; i<=1e5; ++i)
        if(dp[i])//if there is a ____ then we add it to the answer
            ans.push_back(i);
    cout<<ans.size()<<"\n";
    for(int a:ans)
        cout<<a<<" ";

}