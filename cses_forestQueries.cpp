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
//2D prefix sums

const int mxN=1e3;
int n,q, a[mxN+1][mxN+1];
string s[mxN];
 
int main(){
    cin>>n>>q;
    for(int i=0;i<n;++i){
        cin>>s[i];
        for(int j=0;j<n;++j){
            if(s[i][j]=='*')
                ++a[i+1][j+1];}
        for(int j=0;j<n;++j)
            a[i+1][j+1]+=a[i+1][j];
        //for each row I will calculate the prefix sum.
    }
    for(int i=0;i<n;++i){
        for(int j=1;j<=n;++j){
            a[i+1][j]+=a[i][j];// done that again
        
        }
    }
    while(q--){
        int y1,x1,y2,x2;
        cin>>y1>>x1>>y2>>x2,--y1,--x1;
        cout<<a[y2][x2]-a[y1][x2]-a[y2][x1]+a[y1][x1]<<"\n";//using principle of inclusion exclusion we get this

    }
}



