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
#include<ext/pb_ds/assoc_container.hpp>
#include<ext/pb_ds/tree_policy.hpp>
#define ar array
#define ll long long
using namespace std;
using namespace __gnu_pbds;
//2d binary (node) tree
const int mxN=1e3;
int n, q, ft[mxN+1][mxN+1];
string s[mxN];


void upd(int i2,int j2, int x){
    for(int i=i2+1; i<=n; i+=i&-i){
        for(int j=j2+1; j<=n; j+=j&-j)
            ft[i][j]+=x;
    }
}

int qry(int i2, int j2){
    int r=0;
    for(int i=i2;i;i-=i&-i)
        for(int j=j2; j; j-=j&-j)
            r+=ft[i][j];
    return r;
}

int main(){
    cin>>n>>q;
    for(int i=0; i<n; ++i){
        cin>>s[i];
        for(int j=0;j<n;j++)
            if(s[i][j]=='*')
                upd(i,j,1);
    }
    for(int i=0;i<q;++i){
        int qt;
        cin>>qt;
        if(qt==1){
            int y, x;
            cin>>y>>x, --y, --x;
            upd(y,x,s[y][x]=='*'?-1:1);
            if(s[y][x]=='*')    
                s[y][x]='.';
            else
                s[y][x]='*';
        }else{
            int y1,x1,y2,x2;
            cin>>y1>>x1>>y2>>x2;
            cout<<qry(y2,x2)-qry(y1-1,x2)-qry(y2,x1-1)+qry(y1-1,x1-1)<<"\n";
        }
    }
}