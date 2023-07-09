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
//manachers algorithm

const int mxN=1e6;
int n, p[2*mxN+3];
string s;
char c[2*mxN+3];



// // vector<ll> hs(int l, int r){
// //     vector<ll> a;
// //     for(int i=0; i<nb; ++i){
// //         a.push_back(h[i][r+1]-h[i][l]*pB[i][r+1-l]%M);
// //         if(a.back()<0){
// //             a.back()+=M;}}
// //     return a;
// }
int main(){
    cin>>s;
    n=s.size();
    c[0]='1';
    c[1]='*';
    for(int i=0; i<n; ++i){
        c[2*i+2]=s[i];
        c[2*i+3]='*';
    }
    c[2*n+2]='@';
    int d=0;
    for(int i=0; i<=2*n+2; ++i){
        if(i<=d+p[d]){
            p[i]=min(p[2*d-i], d+p[d]-i);
        }
        while(c[i-p[i]]==c[i+p[i]]){
            ++p[i];
        }
        --p[i];
        if(i+p[i]>d+p[d]){
            d=i;
        }
    }
    ar<int,2> ans{0};
    for(int i=1; i<=2*n+2; ++i){
        ans=max(ar<int, 2>{p[i], (i-p[i])/2}, ans);
    }
    for(int i=ans[1]; i<ans[1]+ans[0]; ++i){
        cout<<s[i];
    }


}