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

//this is just a dp problem, difficult to solve
const int mxN=5e3,mxM=1e6, M=1e9+7;
int n, dp[mxN+1],k;
string s[mxM],t;

struct{
    int m=1,c[mxM+1][26], d[mxM+1][26], sl[mxM+1], ol[mxM+1],de[mxM+1];
    void ins(string s){
        int u=0;
        for(char a:s){
            if(!c[u][a-'a'])
                c[u][a-'a']=m++;
            u=c[u][a-'a'];
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
    cin>>t>>k;
    n=t.size();
    dp[0]=1;
    for(int i=0; i<k; ++i)
        cin>>s[i], ac.ins(s[i]);
    ac.ac();
    int u=0;//node 0
    for(int i=1; i<=n; ++i){
        u=ac.d[u][t[i-1]-'a'];
        int v=ac.ol[u];
        while(v){
            dp[i]=(dp[i]+dp[i-ac.de[v]])%M;
            // cout<<i<<" "<<ac.de[v]<<endl;
            v=ac.ol[ac.sl[v]];
    
        }
    }
        // for(int j=0; j<k; ++j){
        //     bool ok=i>=s[j].size();
        //     for(int l=0; l<s[j].size()&&ok; ++l){
        //         ok&=t[i-s[j].size()+1]==s[j][l];}
        //     if(ok){
        //         dp[i]=(dp[i]+dp[i-s[j].size()])%M;}}}
    cout<<dp[n];
}