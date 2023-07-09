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


const int mxN=1000,mxM=100, M=1e9+7;
int n,m,dp[2][mxN+1][mxM+1];//dp[have we formed it yet?][no. of characters][prefix of the string we can form]
string s;

struct{
    int m=1,c[mxM+1][26], d[mxM+1][26], sl[mxM+1], ol[mxM+1],de[mxM+1];
    void ins(string s){
        int u=0;
        for(char a:s){
            if(!c[u][a-'A'])
                c[u][a-'A']=m++;
            u=c[u][a-'A'];
        }
        ol[u]=u;
    }
    void ac(){
        queue<int> qu;
        qu.push(0);
        while(qu.size()){
            int u=qu.front();
            qu.pop();
            for(int i=0; i<26; ++i){
                if(c[u][i]){
                    int v=c[u][i];
                    de[v]=de[u]+1;
                    sl[v]=d[sl[u]][i];
                    if(!ol[v])
                        ol[v]=ol[sl[v]];
                    d[u][i]=v;
                    qu.push(v);
                }
                else{
                    d[u][i]=d[sl[u]][i];
                }
            }
        }
    }
} ac;

int main(){
    cin>>n>>s;
    ac.ins(s);
    ac.ac();
    dp[0][0][0]=1;
    for(int k: {0,1}){
        for(int i=0; i<n; ++i){
            for(int j=0; j<=s.size(); ++j){
                for(int l=0; l<26; ++l){
                    int j2=ac.d[j][l], k2=k||j2==s.size();
                    dp[k2][i+1][j2]=(dp[k2][i+1][j2]+dp[k][i][j])%M;
                }
            }
        }

    }
    ll ans=0;
    for(int i=0; i<=s.size(); ++i){
        ans=(ans+dp[1][n][i])%M;
    }
    cout<<ans;
}