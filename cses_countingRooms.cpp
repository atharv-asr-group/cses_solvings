#include<iostream>
#include<vector>
#include<array>
#include<set>
#include<algorithm>
#include<map>
#define ll long long
using namespace std;
#define ar array
//counting the number of connected components,
//dfs is done if the condition meets.
const int mxN=1e3;
int n,m;
string s[mxN]; 


bool e(int i,int j){
    return i>=0&&i<n&&j>=0&&j<m&&s[i][j]=='.';
}

void dfs(int i,int j){
    s[i][j]='#';
    if(e(i-1,j)){
        dfs(i-1,j);
    }if(e(i+1,j)){
        dfs(i+1,j);
    }if(e(i,j-1)){
        dfs(i,j-1);
    }if(e(i,j+1)){
        dfs(i,j+1);
    }
}

int main(){
  cin>>n>>m;
  for(int i=0; i<n;++i){
    cin>>s[i];
  }
  int ans=0;
  for(int i=0;i<n;++i){
    for(int j=0;j<n;++j){
        if(e(i,j)){
            dfs(i,j),++ans;
        }
    }
  }
  cout<<ans;
}
