Name:          script1
Version:       1.0
Release:       1%{?dist}
Summary:       script1
Group:         Testing
License:       GPL
URL:           https://git.example.ru/example
Source0:       %{name}-%{version}.tar.gz
BuildRequires: /bin/rm, /bin/mkdir, /bin/cp
Requires:      /bin/bash

BuildArch:     x86_64

%description
A test package

%prep
%setup -q

%install
mkdir -p %{buildroot}%{_bindir}
install -m 755 script1 %{buildroot}%{_bindir}

%files
%{_bindir}/script1

%changelog
* Mon Jan 2 2024 Фамилия Имя <email>
- Added %{_bindir}/script1