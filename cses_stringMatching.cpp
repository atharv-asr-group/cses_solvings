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

//sub problem of the prev problem
const int mxN=5e3,mxM=1e6, M=1e9+7;

string s,t;

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
    cin>>s>>t;
    ac.ins(t);
    ac.ac();
    int u=0,ans=0;
    for(int i=0; i<s.size(); ++i){
        u=ac.d[u][s[i]-'a'];
        if(u==t.size())
            ++ans;
    }
    cout<<ans;
}