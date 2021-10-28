-- DCL : 데이터 제어어 (데이터베이스 사용 권한을 주고 회수하는 명령어)

-- 테이블스페이스의 생성 (테이블을 생성할 수 있는 공간)
CREATE TABLESPACE johnSpace
DATAFILE 'C:\app\USER\product\18.0.0\oradata\XE\john.dbf' SIZE 10M
AUTOEXTEND ON NEXT 5M;
-- 파일이름 john.dbf에 10MB 사이즈로 파일 생성, 자동으로 5MB씩 증가

--새 유저 생성
alter session set "_ORACLE_SCRIPT"=true; --오라클 버젼12c이상에서 cdb,pdb개념이 생겨서 기존 문법을 쓰려면 해당 코드 추가
CREATE USER john IDENTIFIED BY 1234 DEFAULT TABLESPACE johnSpace;
--유저 이름 JOHN, 비밀번호 1234 ,테이블스페이스 JOHNSAPCE사용

--john 계정에 데이터베이스 접속권한 부여
GRANT CREATE SESSION TO john;

--존계정에 테이블 생성 권한 부여
GRANT CREATE TABLE TO john;

--롤(권한들의 모음)을 주기 ,CONNECT는 접속관련 권한들, RESOURCE는 테이블및 객체 사용권한
GRANT CONNECT,RESOURCE TO john;

--DBA롤은 관리자 권한이기 때문에 주지 않는다.

--권한을 제거 REVOKE명령어
--유저 존에 테이블생성, 객체관련 모든 권한 제거
REVOKE CREATE TABLE, RESOURCE FROM john;
--접속권한 제거
REVOKE CONNECT FROM john;

-- 계정 삭제 (접속해제 후 가능)
DROP USER john CASCADE;

-- 테이블 스페이스 삭제
DROP TABLESPACE johnSpace;

-- 계정에 비밀번호 변경 : scott계정의 비번을 tiger로 변경
ALTER USER scott IDENTIFIED BY "tiger";


--현재 오라클 서버의 포트번호 확인
SELECT dbms_xdb.gethttpport() FROM DUAL;

--오라클의 포트번호를 9090으로 바꿔보자
exec dbms_xdb.sethttpport(9090);
commit;