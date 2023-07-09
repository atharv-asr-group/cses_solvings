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
//doing hashing

const int mxN=1e6, M=1000696969,nb=1,B[nb]={69};
int n;
string s;
ll pB[nb][mxN+1], h[nb][mxN+1];

vector<ll> hs(int l, int r){
    vector<ll> a;
    for(int i=0; i<nb; ++i){
        a.push_back(h[i][r+1]-h[i][l]*pB[i][r+1-l]%M);
        if(a.back()<0){
            a.back()+=M;}}
    return a;
}
int main(){
    cin>>s;
    n=s.size();
    for(int i=0; i<nb; ++i){
        pB[i][0]=1;
        for(int j=1; j<=n; ++j){
            pB[i][j]=pB[i][j-1]*B[i]%M;
        }
        for(int j=1; j<=n; ++j){
            h[i][j]=(h[i][j-1]*B[i]+s[j-1]-'a'+1)%M;
        }
    }
    //now we need the border length.
    for(int i=1; i<n; ++i)
        if(hs(0,i-1)==hs(n-i,n-1))
            cout<<i<<" ";
}