#include<iostream>
#include<vector>
#include<queue>
#include<array>
#include<set>
#include<algorithm>
#include<map>
#define ll long long
using namespace std;
#define ar array
const int mxN=1e3 , di[4]={1,0,-1,0} , dj[4]={0,1,0,-1};
const char dc[4]={'D','R','U','L'};
int n,m,si,sj,ti,tj;
string s[mxN],p[mxN]; 
int d[mxN][mxN];

//length of shortest path BFS used.
bool e(int i,int j){
    return i>=0&&i<n&&j>=0&&j<m&&s[i][j]=='.';
}

int main(){
  cin>>n>>m;
  
  for(int i=0; i<n;++i){
    cin>>s[i];
    for(int j =0;j<m;++j){
        if(s[i][j]=='A'){
            si=i,sj=j;//,s[i][j]='.';
        }if(s[i][j]=='B'){
            ti=i,tj=j,s[i][j]='.';
        }
    }
    p[i]=string(m,0);
  }
  queue<ar<int,2>> qu;
  qu.push({si,sj});

  while(qu.size()){
    ar<int,2> u=qu.front();
    qu.pop();
    s[u[0]][u[1]]='#';
    for(int k=0; k<4; ++k){
        int ni=u[0]+di[k], nj=u[1]+dj[k];
        if(!e(ni,nj)){
            continue;
        }
        qu.push({ni,nj});
        s[ni][nj]='#';
        d[ni][nj]=k;
        p[ni][nj]=dc[k];
    }
  }
  if(p[ti][tj]){
    cout<<"YES\n";
    string t;
    while(ti^si||tj^sj){
        t+=p[ti][tj];
        int dd=d[ti][tj]^2;
        ti+=di[dd];
        tj+=dj[dd];
    }
    reverse(t.begin(), t.end());
    cout<< t.size()<<"\n";
    cout<<t;
  }else{
    cout<<"NO";
  }
}
