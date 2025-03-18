import 'package:bloc/bloc.dart';
import 'package:caffeine/featuers/cart/data/model/branch_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'search_branch_state.dart';

class SearchBranchCubit extends Cubit<SearchBranchState> {
  SearchBranchCubit() : super(SearchBranchInitial());

  List<BranchModel> branches = [];

  Future<void> searchBranches({required String searchValue}) async {
    try {
      emit(SearchBranchLoading());
      branches = [];
      FirebaseFirestore.instance.collection('branches').snapshots().listen((
        querySnapshot,
      ) {
        branches = querySnapshot.docs
            .map(
              (doc) =>
                  // ignore: unnecessary_cast
                  BranchModel.fromJson(doc.data()),
            )
            .where((branch) =>
                branch.branchnameEn.toLowerCase().contains(
                      searchValue.toLowerCase(),
                    ) ||
                branch.branchnameAr.toLowerCase().contains(
                      searchValue.toLowerCase(),
                    ) ||
                branch.cityEn.toLowerCase().contains(
                      searchValue.toLowerCase(),
                    ) ||
                branch.cityAr.toLowerCase().contains(
                      searchValue.toLowerCase(),
                    ) ||
                branch.streetEn.toLowerCase().contains(
                      searchValue.toLowerCase(),
                    ) ||
                branch.streetAr.toLowerCase().contains(
                      searchValue.toLowerCase(),
                    ))
            .toList();

        emit(SearchBranchSuccess(branchesList: branches));
      });
    } catch (e) {
      emit(
        SearchBranchFailuer(msg: 'An error occurred. Please try again.'),
      );
    }
  }
}
