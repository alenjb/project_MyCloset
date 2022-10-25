<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
				<!-- Navbar -->

				<nav
					class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
					id="layout-navbar">
					<div
						class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
						<a class="nav-item nav-link px-0 me-xl-4" href="/kkk"> <i
							class="bx bx-menu bx-sm"></i>
						</a>
					</div>
					<!-- 맨 위 navbar -->
					<div class="navbar-nav-right d-flex align-items-center"
						id="navbar-collapse">
						<!-- Search -->
						<div class="navbar-nav align-items-center">
							<div class="nav-item d-flex align-items-center">
								<div class="row">
									<form id="searchForm" action="/qna/list" method="get"
										class="row">
										<div class="col-sm-6">
											<select name="type" class="form-select form-select-sm col-6">
												<option value="TCW"
													<c:out value="${pageMaker.cri.type eq 'TCW'?'selected':''}"/>>전체</option>
												<option value="T"
													<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
												<option value="C"
													<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
												<option value="W"
													<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
												<option value="TC"
													<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목/내용</option>
											</select>
										</div>
										<div class="col-sm-6">
											<!-- 페이지에 관한 정보 클릭한 링크로 날리기 -->
<!-- 											<input type="text" class="form-control border-0 shadow-none col-6" -->
<!-- 												placeholder="검색" name="keyword" />  -->
												<input type="text" class="form-control border-0 shadow-none" placeholder="검색" name="keyword"/>											
												<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
												<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
										</div>
									</form>
								</div>
								<!--검색 창 -->
								<div class="row">
									<!-- 									<div class="col-9"> -->
									<!-- 									<form> -->
									<!-- 									</form> -->
									<!-- 									</div> -->
									<div class="input-group-btn col-3">
										<button class="btn btn-default" id="searchBtn" type="submit">
											<i class="bx bx-search fs-4 lh-0"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- /Search -->

						<ul class="navbar-nav flex-row align-items-center ms-auto">
							<!-- Place this tag where you want the button to render. -->
							<!-- User(내정보 보기) -->
							<li class="nav-item navbar-dropdown dropdown-user dropdown">
								<a class="nav-link dropdown-toggle hide-arrow"
								href="javascript:void(0);" data-bs-toggle="dropdown">
									<div class="avatar avatar-online">
										<img src="/resources/assets/img/avatars/1.png" alt
											class="w-px-40 h-auto rounded-circle" />
									</div>
							</a>
								<ul class="dropdown-menu dropdown-menu-end">
									<li><a class="dropdown-item" href="#">
											<div class="d-flex">
												<div class="flex-shrink-0 me-3">
													<div class="avatar avatar-online">
														<img src="/resources/assets/img/avatars/1.png" alt
															class="w-px-40 h-auto rounded-circle" />
													</div>
												</div>
												<div class="flex-grow-1">
													<span class="fw-semibold d-block"><%=id%></span> <small
														class="text-muted"><%=grade%></small>
												</div>
											</div>
									</a></li>
									<li>
										<div class="dropdown-divider"></div>
									</li>
									<li><a class="dropdown-item" href="/member/myPage"> <i
											class="bx bx-user me-2"></i> <span class="align-middle">내
												프로필</span>
									</a></li>
									<li><a class="dropdown-item" href="setting"> <i
											class="bx bx-cog me-2"></i> <span class="align-middle">환경설정</span>
									</a></li>
									<li>
										<div class="dropdown-divider"></div>
									</li>
									<li><a class="dropdown-item" href="/member/login"> <i
											class="bx bx-power-off me-2"></i> <span class="align-middle">로그아웃</span>
									</a></li>
								</ul>
							</li>
							<!--/ User -->
						</ul>
					</div>
				</nav>

				<!-- / Navbar -->
</html>