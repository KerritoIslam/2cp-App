import 'package:app/features/chat/application/bloc/chat_search/chat_search_bloc.dart';
import 'package:app/features/chat/application/widgets/chat%20_search.dart';
import 'package:app/shared/widgets/loadingIndicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class CompanySearchPage extends StatefulWidget {
  const CompanySearchPage({super.key});

  @override
  State<CompanySearchPage> createState() => _CompanySearchPageState();
}

class _CompanySearchPageState extends State<CompanySearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Hero(
          tag: 'search_bar',
          child: Material(
            color: Colors.transparent,
            child: ChatSearchBar(
              isSearch: true,
              controller: _searchController,
              onSearch: (value) {
                context.read<ChatSearchBloc>().add(
                      ChatSearchCompaniesEvent(
                        query: value,
                        page: 1,
                        limit: 10,
                      ),
                    );
              },
            ),
          ),
        ),
        foregroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: BlocConsumer<ChatSearchBloc, ChatSearchState>(
        listener: (context, state) {
          if (state is ChatSearchError) {
            toastification.show(
              title: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
              type: ToastificationType.error,
              autoCloseDuration: const Duration(seconds: 2),
            );
          }
          if (state is ChatSearchCreateChatSuccess) {
            context.pop();
            final roomName = state.chat.roomName;
            final company = state.chat.company;
            context.push(
              '/protected/chat/conversation/$roomName',
              extra: company,
            );
          }
        },
        builder: (context, state) {
          if (state is ChatSearchLoading ||
              state is ChatSearchCreateChatLoading) {
            return const Center(child: Loadingindicator());
          } else if (state is ChatSearchSuccess) {
            return ListView.builder(
              itemCount: state.companies.length + (state.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == state.companies.length) {
                  context.read<ChatSearchBloc>().add(
                        ChatSearchMoreCompaniesEvent(),
                      );
                  return const Center(child: Loadingindicator());
                }

                final company = state.companies[index];
                return ListTile(
                  tileColor: Colors.grey[800],
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: state.companies[index].profilepic == ''
                        ? const Icon(Icons.business, color: Colors.white)
                        : CachedNetworkImage(
                            imageUrl: state.companies[index].profilepic,
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                              radius: 25.r,
                              backgroundImage: imageProvider,
                            ),
                          ),
                  ),
                  title: Text(
                    company.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    company.category,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    context.read<ChatSearchBloc>().add(
                          ChatSearchCreateChatEvent(userId: company.id),
                        );
                  },
                );
              },
            );
          } else if (state is ChatSearchError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
