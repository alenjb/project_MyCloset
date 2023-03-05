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
						
						<!-- /Search -->

						<ul class="navbar-nav flex-row align-items-center ms-auto">
							<!-- Place this tag where you want the button to render. -->
							<!-- User(내정보 보기) -->
							<li class="nav-item navbar-dropdown dropdown-user dropdown">
								<a class="nav-link dropdown-toggle hide-arrow"
								href="javascript:void(0);" data-bs-toggle="dropdown">
									<div class="avatar avatar-online">
										<img src="/resources/assets/img/avatars/basicUserImage.png" alt
											class="w-px-40 h-auto rounded-circle" />
									</div>
							</a>
								<ul class="dropdown-menu dropdown-menu-end">
									<li><a class="dropdown-item" href="/member/myPage">
											<div class="d-flex">
												<div class="flex-shrink-0 me-3">
													<div class="avatar avatar-online">
														<img src="/resources/assets/img/avatars/basicUserImage.png" alt
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
									<li><a class="dropdown-item"> <i
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